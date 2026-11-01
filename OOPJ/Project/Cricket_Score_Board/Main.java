import java.util.Random;
import java.util.Scanner;

class Team{
    int team_run,team_four,team_six,team_wd,team_w,team_nb,team_ball;
    static int run,four,six,wd,w,nb,overs;
    String team_name;
    Scanner sc = new Scanner(System.in);
    int runs[][];

    Team(){}
    Team(String team_name){ this.team_name=team_name; }

    void update_run(int run){
        team_run += run;
        this.run += run;
        switch(run){
            case 4: team_four++; four++; break;
            case 6: team_six++; six++; break;
        }
    }

    int toss(){
        Random random = new Random();
        if(random.nextInt(2) == 1) return 1;
        return 0;
    }
}

class Player{
    int run,four,six,wd,w,nb,ball;
    String name;
    boolean out;

    Player(String name){ this.name=name; }

    void update_run(int run){
        this.run += run;
        ball++;
        switch(run){
            case 4: four++; break;
            case 6: six++; break;
        }
    }

    void wicket(){
        out = true;
        ball++;
    }
}

public class Main{
    Scanner sc = new Scanner(System.in);

    static void over(){
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter Overs: ");
        int overs = sc.nextInt();
        Team.overs = overs;
        Team team = new Team();
        team.runs = new int[Team.overs][6];

        for(int over=0;over<Team.overs;over++){
            for(int ball=0;ball<6;ball++){
                System.out.println("Enter run at ("+over+"."+ball+")");
                team.runs[over][ball] = sc.nextInt();
            }
        }
    }

    int pickbatsman(int toss){
        System.out.println("Enter batsman numbers: ");
        if(toss == 1){
            System.out.println("1. Rohit Sharma");
            System.out.println("2. Shubman Gill");
            System.out.println("3. Virat Kohli");
            System.out.println("4. Shreyas Iyer");
            System.out.println("5. KL Rahul");
            System.out.println("6. Hardik Pandya");
            System.out.println("7. Ravindra Jadeja");
            System.out.println("8. Shardul Thakur");
            System.out.println("9. Kuldeep Yadav");
            System.out.println("10. Jasprit Bumrah");
            System.out.println("11. Mohammed Siraj");
        }else{
            System.out.println("1. Abdullah Shafique");
            System.out.println("2. Imam-ul-Haq");
            System.out.println("3. Babar Azam");
            System.out.println("4. Mohammad Rizwan");
            System.out.println("5. Saud Shakeel");
            System.out.println("6. Iftikhar Ahmed");
            System.out.println("7. Shadab Khan");
            System.out.println("8. Mohammad Nawaz");
            System.out.println("9. Hasan Ali");
            System.out.println("10. Shaheen Afridi");
            System.out.println("11. Haris Rauf");
        }
        return sc.nextInt();
    }

    int pickbowler(int toss){
        System.out.println("Enter bowler numbers: ");
        if(toss == 1){
            System.out.println("1. Hardik Pandya");
            System.out.println("2. Ravindra Jadeja");
            System.out.println("3. Shardul Thakur");
            System.out.println("4. Kuldeep Yadav");
            System.out.println("5. Jasprit Bumrah");
            System.out.println("6. Mohammed Siraj");
        }else{
            System.out.println("Pakistan Bowlers:");
            System.out.println("1. Iftikhar Ahmed");
            System.out.println("2. Shadab Khan");
            System.out.println("3. Mohammad Nawaz");
            System.out.println("4. Hasan Ali");
            System.out.println("5. Shaheen Afridi");
            System.out.println("6. Haris Rauf");
        }
        return sc.nextInt();
    }

    Player[] createPlayers(String[] names){
        Player[] players = new Player[11];
        for(int i=0;i<11;i++) players[i] = new Player(names[i]);
        return players;
    }

    boolean validRun(String result){
        return result.equals("0") || result.equals("1") || result.equals("2") ||
               result.equals("3") || result.equals("4") || result.equals("6");
    }

    void scorecard(Team team,Player[] players){
        System.out.println("\n========== "+team.team_name+" SCORECARD ==========");
        System.out.println("Score : "+team.team_run+"/"+team.team_w);
        System.out.println("Overs : "+team.team_ball/6+"."+team.team_ball%6);
        System.out.println("4s : "+team.team_four+"  6s : "+team.team_six+
            "  Wides : "+team.team_wd+"  No Balls : "+team.team_nb);
        System.out.println("\nPlayer\t\tRuns\tBalls\t4s\t6s");

        for(int i=0;i<11;i++){
            if(players[i].ball>0 || players[i].out)
                System.out.println(players[i].name+"\t"+players[i].run+"\t"+
                    players[i].ball+"\t"+players[i].four+"\t"+players[i].six);
        }
    }

    void playInnings(Team team,Player[] players,int battingNo,int target){
        System.out.println("\n========== "+team.team_name+" INNINGS ==========");

        int striker = pickbatsman(battingNo)-1;
        int nonStriker = pickbatsman(battingNo)-1;

        while(striker==nonStriker){
            System.out.println("Both batsmen cannot be same.");
            nonStriker=pickbatsman(battingNo)-1;
        }

        for(int over=0;over<Team.overs && team.team_w<10 &&
            team.team_run<target;over++){

            int ball=0;
            System.out.println("\n---------- OVER "+(over+1)+" ----------");

            // Bowler is selected only once for the complete over.
            System.out.println("Select bowler for this over:");
            pickbowler(1-battingNo);

            while(ball<6 && team.team_w<10 && team.team_run<target){

                System.out.println("\nStriker : "+players[striker].name);
                System.out.println("Non-Striker : "+players[nonStriker].name);
                System.out.println("Score : "+team.team_run+"/"+team.team_w+
                    "  Overs : "+team.team_ball/6+"."+team.team_ball%6);

                System.out.print("Enter result (0/1/2/3/4/6/W/WD/NB): ");
                String result=sc.next().toUpperCase();

                if(result.equals("WD")){
                    team.team_run++;
                    team.team_wd++;
                    System.out.println("Wide Ball +1");
                    continue;
                }

                if(result.equals("NB")){
                    team.team_run++;
                    team.team_nb++;
                    System.out.println("No Ball +1 - FREE HIT");
                    continue;
                }

                if(result.equals("W")){
                    players[striker].wicket();
                    team.team_w++;
                    team.team_ball++;
                    team.runs[over][ball]=-3;
                    ball++;

                    System.out.println(players[striker].name+" OUT!");

                    if(team.team_w<10){
                        int newBatsman=pickbatsman(battingNo)-1;

                        while(newBatsman==nonStriker || players[newBatsman].out){
                            System.out.println("Invalid batsman.");
                            newBatsman=pickbatsman(battingNo)-1;
                        }

                        striker=newBatsman;
                    }
                    continue;
                }

                if(validRun(result)){
                    int run=Integer.parseInt(result);

                    players[striker].update_run(run);
                    team.update_run(run);
                    team.team_ball++;
                    team.runs[over][ball]=run;
                    ball++;

                    System.out.println(players[striker].name+
                        " scored "+run+" run(s)");

                    if(run==1 || run==3){
                        int temp=striker;
                        striker=nonStriker;
                        nonStriker=temp;
                    }
                }else{
                    System.out.println("Invalid input!");
                }
            }

            // Strike changes only after the over is completed.
            if(ball==6){
                int temp=striker;
                striker=nonStriker;
                nonStriker=temp;
                System.out.println("End of Over "+(over+1));
            }
        }

        scorecard(team,players);
    }

    void result(Team india,Team pakistan,String firstTeam,String secondTeam){
        System.out.println("\n========== MATCH RESULT ==========");
        System.out.println("India : "+india.team_run+"/"+india.team_w+
            "  Pakistan : "+pakistan.team_run+"/"+pakistan.team_w);

        if(india.team_run==pakistan.team_run){
            System.out.println("\nMATCH TIED!");
            return;
        }

        String winner=india.team_run>pakistan.team_run ? "India" : "Pakistan";
        Team win=winner.equals("India") ? india : pakistan;
        Team lose=winner.equals("India") ? pakistan : india;

        if(winner.equals(secondTeam))
            System.out.println("\n"+winner+" WON BY "+(10-win.team_w)+" WICKETS!");
        else
            System.out.println("\n"+winner+" WON BY "+(win.team_run-lose.team_run)+" RUNS!");
    }

    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        Team team=new Team();
        Team india=new Team("India");
        Team pakistan=new Team("Pakistan");

        System.out.print("Enter Overs: ");
        Team.overs=sc.nextInt();

        while(Team.overs<=0){
            System.out.print("Enter valid overs: ");
            Team.overs=sc.nextInt();
        }

        india.runs=new int[Team.overs][6];
        pakistan.runs=new int[Team.overs][6];

        String[] indiaPlaying11={
            "Rohit Sharma","Shubman Gill","Virat Kohli","Shreyas Iyer",
            "KL Rahul","Hardik Pandya","Ravindra Jadeja","Shardul Thakur",
            "Kuldeep Yadav","Jasprit Bumrah","Mohammed Siraj"};

        String[] pakistanPlaying11={
            "Abdullah Shafique","Imam-ul-Haq","Babar Azam","Mohammad Rizwan",
            "Saud Shakeel","Iftikhar Ahmed","Shadab Khan","Mohammad Nawaz",
            "Hasan Ali","Shaheen Afridi","Haris Rauf"};

        Main game=new Main();
        Player[] indiaPlayers=game.createPlayers(indiaPlaying11);
        Player[] pakistanPlayers=game.createPlayers(pakistanPlaying11);

        // Toss is generated exactly once.
        int tossResult=team.toss();

        if(tossResult==1) System.out.println("\nIndia Won the Toss");
        else System.out.println("\nPakistan Won the Toss");

        System.out.println("\n1: Batting");
        System.out.println("2: Bowling");
        System.out.print("Enter choice: ");
        int choice=sc.nextInt();

        while(choice!=1 && choice!=2){
            System.out.print("Enter 1 or 2: ");
            choice=sc.nextInt();
        }

        String firstTeam,secondTeam;

        if(tossResult==1){
            if(choice==1){
                firstTeam="India";
                secondTeam="Pakistan";
            }else{
                firstTeam="Pakistan";
                secondTeam="India";
            }
        }else{
            if(choice==1){
                firstTeam="Pakistan";
                secondTeam="India";
            }else{
                firstTeam="India";
                secondTeam="Pakistan";
            }
        }

        System.out.println("\n"+firstTeam+" will bat first.");

        if(firstTeam.equals("India"))
            game.playInnings(india,indiaPlayers,1,Integer.MAX_VALUE);
        else
            game.playInnings(pakistan,pakistanPlayers,0,Integer.MAX_VALUE);

        int target=firstTeam.equals("India") ? india.team_run+1 : pakistan.team_run+1;
        System.out.println("\nTarget = "+target);

        if(secondTeam.equals("India"))
            game.playInnings(india,indiaPlayers,1,target);
        else
            game.playInnings(pakistan,pakistanPlayers,0,target);

        game.result(india,pakistan,firstTeam,secondTeam);
        sc.close();
    }
}