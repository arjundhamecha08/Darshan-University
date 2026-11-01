#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct node {
    char song[100];
    struct node *prev;
    struct node *link;
};

struct node *first = NULL;
struct node *current = NULL;

int isPlaying = 0;

// Add song to playlist
void addSong(char name[]) {
    struct node *newnode, *last;

    newnode = (struct node *)malloc(sizeof(struct node));

    if (newnode == NULL) {
        printf("Memory allocation failed.\n");
        return;
    }

    strcpy(newnode->song, name);

    if (first == NULL) {
        newnode->link = newnode;
        newnode->prev = newnode;

        first = newnode;
        current = newnode;
    } else {
        last = first->prev;

        newnode->link = first;
        newnode->prev = last;

        last->link = newnode;
        first->prev = newnode;
    }

    printf("Song added successfully.\n");
}

// Play current song
void playSong() {
    if (current == NULL) {
        printf("Playlist is empty.\n");
        return;
    }

    isPlaying = 1;

    printf("Now Playing: %s\n", current->song);
}

// Pause current song
void pauseSong() {
    if (current == NULL || isPlaying == 0) {
        printf("No song is currently playing.\n");
        return;
    }

    isPlaying = 0;
    printf("Song paused: %s\n", current->song);
}

// Play next song
void nextSong() {
    if (current == NULL) {
        printf("Playlist is empty.\n");
        return;
    }

    current = current->link;
    playSong();
}

// Play previous song
void previousSong() {
    if (current == NULL) {
        printf("Playlist is empty.\n");
        return;
    }

    current = current->prev;
    playSong();
}

// Delete a song by name
void deleteSong(char name[]) {
    struct node *save;

    if (first == NULL) {
        printf("Playlist is empty.\n");
        return;
    }

    save = first;

    do {
        if (strcmp(save->song, name) == 0) {

            if (save->link == save) {
                first = NULL;
                current = NULL;
                isPlaying = 0;
            } else {
                save->prev->link = save->link;
                save->link->prev = save->prev;

                if (save == first) {
                    first = save->link;
                }

                if (save == current) {
                    current = save->link;
                    isPlaying = 0;
                }
            }

            free(save);
            printf("Song deleted successfully.\n");
            return;
        }

        save = save->link;

    } while (save != first);

    printf("Song not found.\n");
}

// Display playlist
void displayPlaylist() {
    struct node *save;

    if (first == NULL) {
        printf("Playlist is empty.\n");
        return;
    }

    save = first;

    printf("\n--- MUSIC PLAYLIST ---\n");

    do {
        if (save == current) {
            printf(">> %s", save->song);

            if (isPlaying)
                printf(" [PLAYING]");
            else
                printf(" [CURRENT]");

        } else {
            printf("   %s", save->song);
        }

        printf("\n");
        save = save->link;

    } while (save != first);
}

// Free all allocated memory
void freePlaylist() {
    struct node *save;

    if (first == NULL)
        return;

    save = first->link;

    while (save != first) {
        struct node *temp = save;
        save = save->link;
        free(temp);
    }

    free(first);

    first = NULL;
    current = NULL;
    isPlaying = 0;
}

// Main function
int main() {
    int choice;
    char name[100];

    do {
        printf("\n===== MUSIC PLAYER =====\n");
        printf("1. Add Song\n");
        printf("2. Play Song\n");
        printf("3. Pause Song\n");
        printf("4. Next Song\n");
        printf("5. Previous Song\n");
        printf("6. Delete Song\n");
        printf("7. Display Playlist\n");
        printf("8. Exit\n");

        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {

            case 1:
                printf("Enter song name: ");
                scanf(" %99[^\n]", name);
                addSong(name);
                break;

            case 2:
                playSong();
                break;

            case 3:
                pauseSong();
                break;

            case 4:
                nextSong();
                break;

            case 5:
                previousSong();
                break;

            case 6:
                printf("Enter song name to delete: ");
                scanf(" %99[^\n]", name);
                deleteSong(name);
                break;

            case 7:
                displayPlaylist();
                break;

            case 8:
                freePlaylist();
                printf("Music Player Closed.\n");
                break;

            default:
                printf("Invalid choice.\n");
        }

    } while (choice != 8);

    return 0;
}