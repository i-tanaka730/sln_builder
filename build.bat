@echo off

rem +----------------------------------------------------------+
rem | ソリューションをビルドするバッチです。
rem | ビルド実行前にgitから最新ソースを取得することもできます。
rem | 以下の手順で使用してください。
rem |   1. ユーザー変数をプロジェクトに合わせて書き換え。
rem |   2. 当バッチを実行。
rem +----------------------------------------------------------+

rem --- ユーザー変数 ---

rem MSBuildのパス
set MSBUILD_PATH=C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe

rem ソリューションファイルのパス
set SOLUTION_FILE=C:\xxxxx\xxxxx.sln
rem ビルド構成 (debug / release)
set BUILD_CONFIG=debug
rem ビルド種類 (build / rebuild)
set BUILD_TYPE=build

rem 最新ソース取得有無 (true / false)
set PULL_SOURCE=false
rem ブランチのパス
set BRANCH_PATH=C:\xxxxx
rem ブランチの名前
set BRANCH_NAME=xxxxx


rem --- 処理実行 ---

cd /d "%BRANCH_PATH%"

if not exist "%MSBUILD_PATH%" (
    echo エラー:MSBuildが存在しません
    exit /b 0
)

if not exist "%SOLUTION_FILE%" (
    echo エラー:ソリューションファイルが存在しません
    exit /b 0
)

if not "%BUILD_CONFIG%"=="debug" if not "%BUILD_CONFIG%"=="release" (
    echo エラー:ビルド構成が不正です
    exit /b 0
)

if not "%BUILD_TYPE%"=="build" if not "%BUILD_TYPE%"=="rebuild" (
    echo エラー:ビルド種類が不正です
    exit /b 0
)

if not "%PULL_SOURCE%"=="true" if not "%PULL_SOURCE%"=="false" (
    echo エラー:最新ソース取得有無が不正です
    exit /b 0
)

if "%PULL_SOURCE%"=="true" (
    if not exist "%BRANCH_PATH%" (
        echo エラー:ブランチが存在しません
        exit /b 0
    ) else (
        git checkout %BRANCH_NAME%
        git pull --prune
        @echo ソースを取得しました
    )
)

%MSBUILD_PATH% %SOLUTION_FILE% /p:Configuration=%BUILD_CONFIG% /t:%BUILD_TYPE% /m

@echo ビルドが完了しました
pause
exit 0
