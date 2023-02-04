CREATE TABLE "Doctor" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "title" text   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patient" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "birthdate" text   NOT NULL,
    "address" text   NOT NULL,
    "insurance" text   NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visit" (
    "id" serial   NOT NULL,
    "doctor_id" INTEGER   NOT NULL,
    "patient_id" INTEGER   NOT NULL,
    "date" text   NOT NULL,
    CONSTRAINT "pk_Visit" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnosis" (
    "id" serial   NOT NULL,
    "visit_id" INTEGER   NOT NULL,
    "name" text   NOT NULL,
    "description" text   NOT NULL,
    "treatment" text   NOT NULL,
    CONSTRAINT "pk_Diagnosis" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctor" ("id");

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patient" ("id");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visit" ("id");

