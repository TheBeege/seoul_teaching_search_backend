# TODOS

* Setup project via Spring Initializr
    * We'll need MVC/REST, Security (for later), JPA/Hibernate, and OpenAPI/Swagger support.
* Setup docker-compose for running a local test PostgreSQL database with seed data.
* Create a list job postings endpoint.
    * Add pagination parameters.
    * Add filtering parameters.
        * Zero or more visas supported.
        * Zero or more age groups.
        * Zero or more locations.
        * 12am to 12am working hours constraint.
        * 0 KRW to 50m KRW monthly salary constraint but as a full integer.
