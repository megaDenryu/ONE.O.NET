# このリポジトリのツールの唯一の入口。新しいツールを足すときは $作業一覧 の配列へ要素を1つ追記する
# 追記の形: @{ 名前 = '日本語名'; 説明 = '日本語の説明'; 実行 = { 実行する処理 } }
# 実行場所: どこでもよい(このファイルの位置から場所を解決する)
[CmdletBinding()]
param(
    [switch]$List,
    [int]$Run = 0
)

$ErrorActionPreference = 'Stop'
$リポジトリのルート = $PSScriptRoot

$作業一覧 = @(
)

function 一覧を表示する {
    Write-Host ''
    Write-Host '  ONE.O.NET のツール一覧' -ForegroundColor Cyan
    Write-Host ''
    if ($作業一覧.Count -eq 0) {
        Write-Host '  ツールはまだ登録されていない' -ForegroundColor DarkGray
    }
    for ($i = 0; $i -lt $作業一覧.Count; $i++) {
        $番号 = $i + 1
        Write-Host ("  {0,2}. {1}" -f $番号, $作業一覧[$i].名前) -ForegroundColor White
        Write-Host ("      {0}" -f $作業一覧[$i].説明) -ForegroundColor DarkGray
    }
    Write-Host ''
    Write-Host '  使い方: .\tool.ps1 -List | .\tool.ps1 -Run <番号> | .\tool.ps1(対話)' -ForegroundColor DarkGray
    Write-Host ''
}

function 番号で実行する([int]$番号) {
    if ($番号 -lt 1 -or $番号 -gt $作業一覧.Count) {
        throw "番号 $番号 に対応するツールがない。登録されているツールは $($作業一覧.Count) 件である"
    }
    $作業 = $作業一覧[$番号 - 1]
    Write-Host ("  実行: {0}" -f $作業.名前) -ForegroundColor Cyan
    & $作業.実行
}

if ($Run -gt 0) { 番号で実行する $Run; return }
一覧を表示する
if ($List -or $作業一覧.Count -eq 0) { return }

$入力 = Read-Host '  番号を入力する(何も入れずに Enter で終える)'
if ([string]::IsNullOrWhiteSpace($入力)) { return }
番号で実行する ([int]$入力)
