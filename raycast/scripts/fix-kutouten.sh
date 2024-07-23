#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Fix kutouten
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ⚪

# クリップボードの内容を取得
clipboard_content=$(pbpaste)

# 文字の変換
converted_content=$(echo $clipboard_content | tr '、。' '，．')

# 変換した内容をクリップボードに保存
echo $converted_content | pbcopy
