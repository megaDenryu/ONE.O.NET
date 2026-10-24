# ONE.O.NET

OneOnet のネイティブ版である。WinUI 3 + .NET 11 / C# 15 で、現行の Python + TypeScript の Web UI 版を作り直す。層(C# のプロジェクト)の骨組みと規約があり、機能のコードはまだ無い。層と参照の向きは [_doc/設計/アーキテクチャ.md](_doc/設計/アーキテクチャ.md) にある。

## 旧版と試作

現行の Web UI 版は、旧版(非公開のリポジトリ RefucteringVoiroStudio)である。ネイティブ版の試作と、試作を決めた調査は、旧版の中にあり、このリポジトリからは辿れない。このリポジトリが受け継ぐ判断は、規約と設計の文書の中に理由ごと書く。

## クローン

画面の部品のライブラリ SengenWinUI3 を git のサブモジュールとして `submodules/SengenWinUI3` に置いているため、サブモジュールごとクローンする。

```powershell
git clone --recurse-submodules https://github.com/megaDenryu/ONE.O.NET.git
```

`--recurse-submodules` を付けずにクローンしたときは、リポジトリのルートで `git submodule update --init` を実行する。ビルドには、`global.json` で固定した .NET SDK(.NET 11 RC2)を導入する。

## ツールの入口

ツールはすべて `tool.ps1` に集約する。

```powershell
# 実行場所: リポジトリのルート
.\tool.ps1          # 対話で選ぶ
.\tool.ps1 -List    # 一覧だけを表示する
.\tool.ps1 -Run 1   # 番号で直接実行する
```

新しいツールを作ったときは `tool.ps1` の `$作業一覧` へ登録する。登録するまでが作成である。登録のないツールは、後から来た人が索引から見つけられないため、存在しないのと同じになる。

## 文書一覧(生存型)

生存型の文書とは、現在の実装と一致している義務を負う文書のことである。実装を変えたらこちらも直す。文書を作ったら、この表へ登録する。

| 文書 | 扱う範囲 |
|---|---|
| [_doc/設計/アーキテクチャ.md](_doc/設計/アーキテクチャ.md) | 層(C# のプロジェクト)・参照の向き・補助プロセスとの通信の型の表し方・見込む変更 |
| [CLAUDE.md](CLAUDE.md) | サブエージェントと親のセッションが読むものの入口 |
| [.claude/commands/rule.md](.claude/commands/rule.md) | 役割と触る領域ごとに読む規約の表 |
| [.claude/規約/将軍.md](.claude/規約/将軍.md) | 親のセッション(将軍)が読むものと引き継ぎの運用 |
| [.claude/規約/リポジトリの地図.md](.claude/規約/リポジトリの地図.md) | ツールの入口、文書置き場、旧版と試作の扱い、.NET SDK、SengenWinUI3 のサブモジュール、まだ無いもの |
| [.claude/規約/コード/coding_rule.md](.claude/規約/コード/coding_rule.md) | 設計原則(型安全、DTO、Result 型、FP/OOP ハイブリッド) |
| [.claude/規約/コード/csharp_coding_rules.md](.claude/規約/コード/csharp_coding_rules.md) | C# 固有の構文・ツール・命名 |
| [.claude/規約/コード/判別共用体の失敗パターン.md](.claude/規約/コード/判別共用体の失敗パターン.md) | 判別共用体の設計失敗パターンとチェックリスト |

## 文書一覧(ログ型)

ログ型の文書とは、書いた時点の記録であり、追記だけを行う文書のことである。過去の記述を現在に合わせて直さない。

| 置き場 | 扱う範囲 |
|---|---|
| `_doc/調査/` | 調査の記録 |

## 構成

| 場所 | 中身 |
|---|---|
| `OneONet.sln` | ソリューション |
| `src/` | 層ごとの C# のプロジェクト |
| `submodules/SengenWinUI3` | 画面の部品のライブラリ(git のサブモジュール) |
| `Directory.Build.props` | 全プロジェクトに共通の設定 |
| `global.json` | ビルドに使う .NET SDK の版 |
| `_doc/設計/` | 生存型文書 |
| `_doc/調査/` | ログ型文書(今は空) |
| `.claude/` | 規約と、規約を読む入口 |
| `tool.ps1` | ツールの入口 |
