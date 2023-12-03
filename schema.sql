
DROP TABLE IF EXISTS "public"."ZipCode";
CREATE TABLE "public"."ZipCode" (
  "ZIPCODE" text COLLATE "pg_catalog"."default",
  "BLDGZIP" text COLLATE "pg_catalog"."default",
  "PO_NAME" text COLLATE "pg_catalog"."default",
  "POPULATION" float8,
  "AREA" float8,
  "STATE" text COLLATE "pg_catalog"."default",
  "COUNTY" text COLLATE "pg_catalog"."default",
  "ST_FIPS" text COLLATE "pg_catalog"."default",
  "CTY_FIPS" text COLLATE "pg_catalog"."default",
  "URL" text COLLATE "pg_catalog"."default",
  "SHAPE_AREA" float8,
  "SHAPE_LEN" float8,
  "geometry" "public"."geometry"
)
;

CREATE INDEX "idx_ZipCode_geometry" ON "public"."ZipCode" USING gist (
  "geometry" "public"."gist_geometry_ops_2d"
);

DROP TABLE IF EXISTS "public"."NYC_311";
CREATE TABLE "public"."NYC_311" (
  "ZipCode" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "Time" date NOT NULL,
  "Latitude" float8,
  "Longitude" float8,
  "ComplaintType" varchar(255) COLLATE "pg_catalog"."default"
)
;


DROP TABLE IF EXISTS "public"."NYC_Tree";
CREATE TABLE "public"."NYC_Tree" (
  "ID" int8 NOT NULL,
  "ZipCode" varchar(10) COLLATE "pg_catalog"."default",
  "Longitude" float8,
  "Latitude" float8,
  "Species" varchar(255) COLLATE "pg_catalog"."default",
  "Status" varchar(255) COLLATE "pg_catalog"."default",
  "Health" varchar(255) COLLATE "pg_catalog"."default"
)
;

ALTER TABLE "public"."NYC_Tree" ADD CONSTRAINT "Tree_pkey" PRIMARY KEY ("ID");

DROP TABLE IF EXISTS "public"."Zillow";
CREATE TABLE "public"."Zillow" (
  "ZipCode" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "Time" date NOT NULL,
  "Rent" float4
)
;

ALTER TABLE "public"."Zillow" ADD CONSTRAINT "Rent_pkey" PRIMARY KEY ("ZipCode", "Time");

