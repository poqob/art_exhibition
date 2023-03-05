class Art {
  //main
  late final int? artId;
  late final String? artName;
  late final int? artArtistId;
  late final int? artMaterialId;
  late final int? artMovementId;
  late final int? artAboutId;
  // DATE canceled.

  //about
  late final String? artistName;
  late final String? materialName;
  late final String? movementName;

  //comes from second query
  late final String? content;
  late final String? imgPath;

  Art.fromList(List art) {
    artId = art[0];
    artName = art[1];
    artArtistId = art[2];
    artMaterialId = art[3];
    artMovementId = art[4];
    artAboutId = art[5];
    artistName = art[6];
    materialName = art[7];
    movementName = art[8];
    content = art[9];
    imgPath = art[10];
  }
}

//to call
//select * from arts.allPaints(); 
//select * from arts.allArchitecture();
//select * from arts.allDecorative();



/**
 
CREATE OR REPLACE FUNCTION arts.allPaints()
RETURNS Table(art_id integer, art_name character varying, art_artist_id integer, art_material_id integer,
	  art_movement_id integer, art_about_id integer,
	  artist_name character varying(30),art_artist_id0 integer,
	  material_name character varying(20), art_material_id0 integer,
	  movement_name character varying, art_movement_id0 integer,
	  about_text text,
	  art_about_id0 integer,
	  about_img text ) 
AS
$$ 
BEGIN
	return query
	select * from	
	(select arts.art.art_id, arts.art.art_name, arts.art_paints.art_artist_id,arts.art_paints.art_material_id, arts.art_paints.art_movement_id, arts.art_paints.art_about_id
	 from arts.art inner join arts.art_paints on arts.art.art_id = arts.art_paints.art_id )as t1 
	 inner join (select artists.artists.artist_name, artists.artists.artist_id  from artists.artists ) as t2 
	 on (t1.art_artist_id = t2.artist_id)
	 inner join (select material.material.material_name, material.material.material_id from material.material) as t4
	 on (t1.art_material_id = t4.material_id)
	 inner join (select movements.movement.movement_name, movements.movement.movement_id from movements.movement) as t5
	 on (t1.art_movement_id = t5.movement_id )
	 inner join (select about.about_art.about_text, about.about_art.about_id, about.about_art.about_img from about.about_art ) as t6
	 on (t1.art_about_id = t6.about_id);
END;
$$ 
LANGUAGE plpgsql;
 */