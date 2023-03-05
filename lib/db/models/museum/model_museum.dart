class Museum {
  late final int? museumId;
  late final String? museumName;
  late final int? countryId;
  late final int? cityId;
  late final int? districtId;
  late final int? aboutId;

  //about
  late final String? imagePath;
  late final String? content;

  Museum();

  Museum.fromList(List museum) {
    museumId = museum[0];
    museumName = museum[1];
    countryId = museum[2];
    cityId = museum[3];
    districtId = museum[4];
    aboutId = museum[5];
    content = museum[6];
    imagePath = museum[7];
  }
}

/*
CREATE OR REPLACE FUNCTION museums.allMuseums()
RETURNS table(museumId integer,museumName character varying(30), country_id integer, city_id integer, district_id integer, about_id integer, content_text text,image_path text)
AS
$$ 
BEGIN
return query (select museums.museums.museum_id, museums.museums.museum, museums.museums.country_id , museums.museums.city_id,
	museums.museums.district_id,museums.museums.about_id, about.about_museum.about_text, about.about_museum.about_img from museums.museums 
	inner join about.about_museum on museums.museums.about_id = about.about_museum.about_id );
END;
$$ 
LANGUAGE plpgsql;
 */