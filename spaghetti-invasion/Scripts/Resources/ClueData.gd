class_name ClueData
extends Resource


enum DiaryPages {
	BORGO_ABBANDONATO,
	CASCATA,
	VALLE_OSCURA,
	PONTE,
	ABBAZIA,
	CAPANNO_DEI_CACCIATORI,
	RADURA_ALIENA
}

enum ClueID {
	FORI_PROIETTILI,
	LIQUIDO_GIALLO,
	FOTO_FAMIGLIA,
}


@export var diary_page_ID: DiaryPages
@export var clue_ID: ClueID
