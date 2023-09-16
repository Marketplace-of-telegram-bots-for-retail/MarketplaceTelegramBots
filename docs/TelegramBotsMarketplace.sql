CREATE SCHEMA "users";

CREATE SCHEMA "marketplace";

CREATE TABLE "users"."user" (
  "id" int PRIMARY KEY,
  "login" login,
  "email" email,
  "name" varchar,
  "surname" varchar,
  "phone" varchar,
  "is_bayer" bool DEFAULT False,
  "is_seller" bool DEFAULT False,
  "favorites" int,
  "is_active" bool,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "marketplace"."product" (
  "id" int PRIMARY KEY,
  "user_id" int,
  "name" varchar,
  "art" int,
  "cathegory" varchar,
  "video" varchar,
  "image" image,
  "gallery_id" int,
  "avatar" image,
  "price" decimal,
  "description" text,
  "is_active" bool,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "marketplace"."gallery" (
  "id" int PRIMARY KEY,
  "image" image
);

CREATE TABLE "marketplace"."review_rating" (
  "id" int PRIMARY KEY,
  "user_id" int,
  "product_id" int,
  "rating" int,
  "text" text,
  "is_active" bool,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "marketplace"."shopping_cart" (
  "id" int PRIMARY KEY,
  "user_id" int,
  "product_id" int,
  "quantity" int DEFAULT 1,
  "is_active" bool,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "marketplace"."order" (
  "id" int PRIMARY KEY,
  "user_id" int,
  "prduct_list" int,
  "is_paid" bool,
  "sale_status" bool DEFAULT False,
  "is_active" bool,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "marketplace"."order_product_list" (
  "id" int,
  "order_id" int,
  "product_id" int,
  "quantity" int
);

COMMENT ON COLUMN "users"."user"."favorites" IS 'Many to Many Field to Product';

COMMENT ON COLUMN "marketplace"."product"."name" IS 'Less than 200';

COMMENT ON COLUMN "marketplace"."product"."art" IS 'auto increment';

COMMENT ON COLUMN "marketplace"."product"."video" IS 'URLField';

COMMENT ON COLUMN "marketplace"."product"."image" IS 'ссылка';

COMMENT ON COLUMN "marketplace"."product"."avatar" IS 'ссылка';

COMMENT ON COLUMN "marketplace"."gallery"."image" IS 'ref';

ALTER TABLE "marketplace"."product" ADD FOREIGN KEY ("user_id") REFERENCES "users"."user" ("id");

ALTER TABLE "marketplace"."shopping_cart" ADD FOREIGN KEY ("user_id") REFERENCES "users"."user" ("id");

ALTER TABLE "marketplace"."order" ADD FOREIGN KEY ("user_id") REFERENCES "users"."user" ("id");

ALTER TABLE "marketplace"."product" ADD FOREIGN KEY ("gallery_id") REFERENCES "marketplace"."gallery" ("id");

ALTER TABLE "marketplace"."review_rating" ADD FOREIGN KEY ("user_id") REFERENCES "users"."user" ("id");

ALTER TABLE "marketplace"."review_rating" ADD FOREIGN KEY ("product_id") REFERENCES "marketplace"."product" ("id");

ALTER TABLE "marketplace"."order_product_list" ADD FOREIGN KEY ("order_id") REFERENCES "marketplace"."order" ("id");

ALTER TABLE "marketplace"."order_product_list" ADD FOREIGN KEY ("product_id") REFERENCES "marketplace"."product" ("id");
