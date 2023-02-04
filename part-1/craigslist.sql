CREATE TABLE "Region" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "User" (
    "id" serial   NOT NULL,
    "prefered_region" INTEGER   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" serial   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "user_id" INTEGER   NOT NULL,
    "location" text   NOT NULL,
    "region_id" INTEGER   NOT NULL,
    "category_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Category" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "User" ADD CONSTRAINT "fk_User_prefered_region" FOREIGN KEY("prefered_region")
REFERENCES "Region" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "User" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("id");

