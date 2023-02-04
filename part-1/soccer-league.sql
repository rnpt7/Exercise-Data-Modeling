CREATE TABLE "Teams" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "location" text   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" serial   NOT NULL,
    "player_id" INTEGER   NOT NULL,
    "match_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Matches" (
    "id" serial   NOT NULL,
    "team_1" INTEGER   NOT NULL,
    "team_2" INTEGER   NOT NULL,
    "stadium_id" INTEGER   NOT NULL,
    "date" text   NOT NULL,
    "season_id" INTEGER   NOT NULL,
    "referees_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Season" (
    "id" serial   NOT NULL,
    "start_date" text   NOT NULL,
    "end_date" text   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Standings" (
    "id" serial   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    "rank" INTEGER   NOT NULL UNIQUE,
    CONSTRAINT "pk_Standings" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Stadiums" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Stadiums" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_team_1" FOREIGN KEY("team_1")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_team_2" FOREIGN KEY("team_2")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_stadium_id" FOREIGN KEY("stadium_id")
REFERENCES "Stadiums" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_season_id" FOREIGN KEY("season_id")
REFERENCES "Season" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_referees_id" FOREIGN KEY("referees_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Standings" ADD CONSTRAINT "fk_Standings_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

