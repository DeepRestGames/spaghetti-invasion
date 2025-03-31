class_name DiaryPage
extends Control


@onready var page_title = $PageTitle

var diary_page_ID: ClueData.DiaryPages


func _ready() -> void:
	var diary_page_name: String = ClueData.DiaryPages.keys()[diary_page_ID]
	page_title.text = diary_page_name.replace("_", " ")
