class Artist {
  late final int? artistId;
  late final String? artistName;
  late final int? artistMovementId;
  late final int? artistAboutId;
  late final int? artistCountryId;
  late final int? artistCityId;

  //about
  late final String? content;
  late final String? imagePath;

  Artist.fromList(List artist) {
    artistId = artist[0];
    artistName = artist[1];
    artistMovementId = artist[2];
    artistAboutId = artist[3];
    artistCountryId = artist[4];
    artistCityId = artist[5];
    content = artist[6];
    imagePath = artist[7];
  }
}

//select * from artists.allArtists();

/*
CREATE OR REPLACE FUNCTION artists.allArtists()
RETURNS table(artistId integer,artistName character varying(30),artistMovementId integer, about_id integer,country_id integer, city_id integer, content_text text,image_path text)
AS
$$ 
BEGIN
return query (select artists.artists.artist_id, artists.artists.artist_name, artists.artists.artist_movement_id ,artists.artists.artist_about_id,
	artists.artists.artist_country_id, artists.artists.artist_city_id, about.about_artist.about_text, about.about_artist.about_img from artists.artists
	inner join about.about_artist on artists.artists.artist_about_id = about.about_artist.about_id );
END;
$$ 
LANGUAGE plpgsql;
 */
