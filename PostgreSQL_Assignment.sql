CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(50)
);

INSERT INTO
    rangers (name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );

CREATE Table species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

INSERT INTO
    species (
        species_id,
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        1,
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        2,
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        3,
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        4,
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );



CREATE Table sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id int REFERENCES species (species_id),
    ranger_id int REFERENCES rangers (ranger_id),
    location VARCHAR(50) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    notes TEXT
);

INSERT INTO
    sightings (
        sighting_id,
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        4,
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );



-- Problem 1. Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers (name, region) VALUES('Derek Fox', 'Coastal Plains');


-- Problem 2. Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) as unique_species_count FROM sightings;
--Problem 3. Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE location LIKE '%Pass%';


--Problem 4. List each ranger's name and their total number of sightings.
SELECT r.name, COUNT(s.sighting_id) as total_sightings FROM rangers r LEFT JOIN sightings s on r.ranger_id=s.ranger_id GROUP BY r.name ORDER BY r.name;


-- Problem 5. List species that have never been sighted.
SELECT common_name FROM species WHERE species_id NOT IN(SELECT DISTINCT species_id FROM sightings);


--Problem 6. Show the most recent 2 sightings.
SELECT sp.common_name, s.sighting_time, r.name    FROM sightings s JOIN species sp on s.species_id= sp.species_id JOIN rangers r on s.ranger_id=r.ranger_id ORDER BY s.sighting_time DESC LIMIT 2;


--Problem 7. Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species SET conservation_status= 'Historic' WHERE discovery_date< '1800-01-01';


--Problem 8. Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id,
CASE 
    WHEN extract(HOUR FROM sighting_time)<12 THEN  'morning'
    WHEN extract(HOUR FROM sighting_time)BETWEEN 12 AND 17 THEN  'afternoon'
    ELSE 'evening'
END 

as time_of_day  FROM sightings;


--Problem 9. Delete rangers who have never sighted any species
DELETE FROM rangers WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);
;

