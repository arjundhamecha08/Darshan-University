/* Registration and login with browser-local demo accounts.
   Passwords are hashed before being written to LocalStorage. This is still only a front-end demo,
   not a substitute for authentication on a server. */

function setFieldError(id, message) {
    const field = document.getElementById(id);
    if (field) field.textContent = message;
}

function loginValidation() {
    let valid = true;
    const identity = document.getElementById("login-email");
    const password = document.getElementById("login-password");

    setFieldError("login-error", "");
    setFieldError("password-error", "");

    if (!identity || !identity.value.trim()) {
        setFieldError("login-error", "Email or username is required.");
        valid = false;
    }
    if (!password || !password.value) {
        setFieldError("password-error", "Password is required.");
        valid = false;
    }
    return valid;
}

function registrationValidation() {
    let valid = true;
    const name = document.getElementById("name");
    const email = document.getElementById("email");
    const username = document.getElementById("username");
    const password = document.getElementById("password");
    const confirmPassword = document.getElementById("confirm-password");
    const terms = document.getElementById("terms");

    ["name-error", "email-error", "username-error", "password-error", "confirm-password-error"].forEach(id => setFieldError(id, ""));

    if (!name || !name.value.trim()) {
        setFieldError("name-error", "Name is required.");
        valid = false;
    }

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email || !emailPattern.test(email.value.trim())) {
        setFieldError("email-error", "Enter a valid email address.");
        valid = false;
    }

    const usernamePattern = /^[a-z0-9_]{3,20}$/;
    if (!username || !usernamePattern.test(username.value.trim())) {
        setFieldError("username-error", "Use 3–20 lowercase letters, numbers, or underscores.");
        valid = false;
    }

    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{8,}$/;
    if (!password || !passwordPattern.test(password.value)) {
        setFieldError("password-error", "Use 8+ characters with uppercase, lowercase, a number, and a special character.");
        valid = false;
    }

    if (!confirmPassword || !confirmPassword.value) {
        setFieldError("confirm-password-error", "Please confirm your password.");
        valid = false;
    } else if (password && password.value !== confirmPassword.value) {
        setFieldError("confirm-password-error", "Passwords do not match.");
        valid = false;
    }

    if (terms && !terms.checked) {
        alert("Please agree to the Terms & Conditions.");
        valid = false;
    }
    return valid;
}

function bytesToHex(bytes) {
    return Array.from(new Uint8Array(bytes), byte => byte.toString(16).padStart(2, "0")).join("");
}

function hexToBytes(hex) {
    const bytes = new Uint8Array(hex.length / 2);
    for (let i = 0; i < bytes.length; i++) bytes[i] = parseInt(hex.substring(i * 2, i * 2 + 2), 16);
    return bytes;
}

async function hashPassword(password, saltHex) {
    if (!window.crypto || !window.crypto.subtle) {
        throw new Error("Password hashing is not available in this browser context. Open the project through VS Code Live Server.");
    }

    let salt;
    if (saltHex) {
        salt = hexToBytes(saltHex);
    } else {
        salt = window.crypto.getRandomValues(new Uint8Array(16));
    }

    const keyMaterial = await window.crypto.subtle.importKey(
        "raw",
        new TextEncoder().encode(password),
        "PBKDF2",
        false,
        ["deriveBits"]
    );
    const derivedBits = await window.crypto.subtle.deriveBits(
        { name: "PBKDF2", salt, iterations: 100000, hash: "SHA-256" },
        keyMaterial,
        256
    );

    return { salt: bytesToHex(salt), hash: bytesToHex(derivedBits) };
}

const registrationForm = document.getElementById("register-form");
if (registrationForm) {
    registrationForm.addEventListener("submit", async function (event) {
        event.preventDefault();
        if (!registrationValidation()) return;

        const name = document.getElementById("name").value.trim();
        const email = document.getElementById("email").value.trim().toLowerCase();
        const username = document.getElementById("username").value.trim().toLowerCase();
        const password = document.getElementById("password").value;
        const users = getUsers();

        const duplicate = users.some(user =>
            user.email.toLowerCase() === email || user.username.toLowerCase() === username
        );
        if (duplicate) {
            if (users.some(user => user.email.toLowerCase() === email)) {
                setFieldError("email-error", "An account with this email already exists.");
            }
            if (users.some(user => user.username.toLowerCase() === username)) {
                setFieldError("username-error", "This username is already taken.");
            }
            return;
        }

        try {
            const passwordData = await hashPassword(password);
            users.push({
                id: Date.now(),
                name,
                email,
                username,
                passwordHash: passwordData.hash,
                passwordSalt: passwordData.salt,
                createdAt: new Date().toISOString()
            });

            if (!saveUsers(users)) throw new Error("Could not save your account to LocalStorage.");
            alert("Account created successfully. Please log in.");
            window.location.href = "login.html";
        } catch (error) {
            console.error(error);
            alert(error.message || "Account could not be created. Please try again.");
        }
    });
}

const loginForm = document.getElementById("login-form");
if (loginForm) {
    loginForm.addEventListener("submit", async function (event) {
        event.preventDefault();
        if (!loginValidation()) return;

        const identity = document.getElementById("login-email").value.trim().toLowerCase();
        const password = document.getElementById("login-password").value;
        const users = getUsers();
        const user = users.find(account =>
            account.email.toLowerCase() === identity || account.username.toLowerCase() === identity
        );

        if (!user) {
            setFieldError("login-error", "No account found. Check your details or register first.");
            return;
        }

        try {
            const passwordData = await hashPassword(password, user.passwordSalt);
            if (passwordData.hash !== user.passwordHash) {
                setFieldError("password-error", "Incorrect password.");
                return;
            }

            const publicUser = { id: user.id, name: user.name, email: user.email, username: user.username };
            if (document.getElementById("remember-me")?.checked) {
                sessionStorage.removeItem(STORAGE_KEYS.currentUser);
                localStorage.setItem(STORAGE_KEYS.currentUser, JSON.stringify(publicUser));
            } else {
                localStorage.removeItem(STORAGE_KEYS.currentUser);
                sessionStorage.setItem(STORAGE_KEYS.currentUser, JSON.stringify(publicUser));
            }
            alert("Login successful. Welcome to MovieNest!");
            window.location.href = "index.html";
        } catch (error) {
            console.error(error);
            alert(error.message || "Login could not be completed. Please try again.");
        }
    });
}
