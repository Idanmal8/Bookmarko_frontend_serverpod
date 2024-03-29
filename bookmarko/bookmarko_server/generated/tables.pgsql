--
-- Class Appointment as table appointments
--

CREATE TABLE "appointments" (
  "id" serial,
  "businessId" integer NOT NULL,
  "customerId" integer NOT NULL,
  "customerName" text NOT NULL,
  "serviceName" text NOT NULL,
  "serviceId" integer NOT NULL,
  "status" text NOT NULL,
  "appointmentDate" timestamp without time zone NOT NULL,
  "paid" boolean NOT NULL
);

ALTER TABLE ONLY "appointments"
  ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Class Business as table business_owners
--

CREATE TABLE "business_owners" (
  "id" serial,
  "firstName" text NOT NULL,
  "lastName" text NOT NULL,
  "businessName" text NOT NULL,
  "phone" text NOT NULL,
  "address" text NOT NULL,
  "email" text NOT NULL,
  "proffesion" text NOT NULL,
  "joined" timestamp without time zone NOT NULL,
  "bio" text
);

ALTER TABLE ONLY "business_owners"
  ADD CONSTRAINT business_owners_pkey PRIMARY KEY (id);


--
-- Class Customer as table customers
--

CREATE TABLE "customers" (
  "id" serial,
  "firstName" text NOT NULL,
  "lastName" text NOT NULL,
  "phone" text NOT NULL,
  "email" text,
  "joined" timestamp without time zone NOT NULL,
  "businessId" integer NOT NULL
);

ALTER TABLE ONLY "customers"
  ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Class OperatingHours as table operating_hours
--

CREATE TABLE "operating_hours" (
  "id" serial,
  "businessId" integer NOT NULL,
  "dayInWeek" text NOT NULL,
  "openTime" timestamp without time zone,
  "closeTime" timestamp without time zone
);

ALTER TABLE ONLY "operating_hours"
  ADD CONSTRAINT operating_hours_pkey PRIMARY KEY (id);


--
-- Class Payment as table payments
--

CREATE TABLE "payments" (
  "id" serial,
  "businessId" integer NOT NULL,
  "customerId" integer NOT NULL,
  "dateAndTime" timestamp without time zone NOT NULL,
  "serviceId" integer NOT NULL,
  "amount" double precision NOT NULL
);

ALTER TABLE ONLY "payments"
  ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Class Review as table reviews
--

CREATE TABLE "reviews" (
  "id" serial,
  "businessId" integer NOT NULL,
  "customerId" integer NOT NULL,
  "stars" integer NOT NULL,
  "review" text,
  "datePublished" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "reviews"
  ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Class Service as table services
--

CREATE TABLE "services" (
  "id" serial,
  "businessId" integer NOT NULL,
  "serviceName" text NOT NULL,
  "serviceDuration" integer NOT NULL,
  "servicePrice" double precision NOT NULL
);

ALTER TABLE ONLY "services"
  ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Class Subscription as table subscriptions
--

CREATE TABLE "subscriptions" (
  "id" serial,
  "businessId" integer NOT NULL,
  "userId" integer NOT NULL,
  "dateAndTime" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "subscriptions"
  ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Class ImageAsset as table user_assets
--

CREATE TABLE "user_assets" (
  "id" serial,
  "image_kind" text NOT NULL,
  "image_s3_id" text NOT NULL,
  "uploaded_timestamp" timestamp without time zone NOT NULL,
  "businessId" integer NOT NULL
);

ALTER TABLE ONLY "user_assets"
  ADD CONSTRAINT user_assets_pkey PRIMARY KEY (id);


