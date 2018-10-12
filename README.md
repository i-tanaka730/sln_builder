# sln_builder

## Overview

It is a batch to build without launching Visual Studio.

## Requirement

- MSBuild

## Usage

#### 1. Git clone
```sh
git clone https://github.com/i-tanaka730/sln_builder/
```

#### 2. Edit build.bat
```sh
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
```

#### 3. Run build.bat
```sh
build.bat
```

## License
[MIT](https://github.com/i-tanaka730/sln_builder/blob/master/LICENSE)

## Author
[Ikuya Tanaka](https://github.com/i-tanaka730)
