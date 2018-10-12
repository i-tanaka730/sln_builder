@echo off

rem +----------------------------------------------------------+
rem | �\�����[�V�������r���h����o�b�`�ł��B
rem | �r���h���s�O��git����ŐV�\�[�X���擾���邱�Ƃ��ł��܂��B
rem | �ȉ��̎菇�Ŏg�p���Ă��������B
rem |   1. ���[�U�[�ϐ����v���W�F�N�g�ɍ��킹�ď��������B
rem |   2. ���o�b�`�����s�B
rem +----------------------------------------------------------+

rem --- ���[�U�[�ϐ� ---

rem MSBuild�̃p�X
set MSBUILD_PATH=C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe

rem �\�����[�V�����t�@�C���̃p�X
set SOLUTION_FILE=C:\xxxxx\xxxxx.sln
rem �r���h�\�� (debug / release)
set BUILD_CONFIG=debug
rem �r���h��� (build / rebuild)
set BUILD_TYPE=build

rem �ŐV�\�[�X�擾�L�� (true / false)
set PULL_SOURCE=false
rem �u�����`�̃p�X
set BRANCH_PATH=C:\xxxxx
rem �u�����`�̖��O
set BRANCH_NAME=xxxxx


rem --- �������s ---

cd /d "%BRANCH_PATH%"

if not exist "%MSBUILD_PATH%" (
    echo �G���[:MSBuild�����݂��܂���
    exit /b 0
)

if not exist "%SOLUTION_FILE%" (
    echo �G���[:�\�����[�V�����t�@�C�������݂��܂���
    exit /b 0
)

if not "%BUILD_CONFIG%"=="debug" if not "%BUILD_CONFIG%"=="release" (
    echo �G���[:�r���h�\�����s���ł�
    exit /b 0
)

if not "%BUILD_TYPE%"=="build" if not "%BUILD_TYPE%"=="rebuild" (
    echo �G���[:�r���h��ނ��s���ł�
    exit /b 0
)

if not "%PULL_SOURCE%"=="true" if not "%PULL_SOURCE%"=="false" (
    echo �G���[:�ŐV�\�[�X�擾�L�����s���ł�
    exit /b 0
)

if "%PULL_SOURCE%"=="true" (
    if not exist "%BRANCH_PATH%" (
        echo �G���[:�u�����`�����݂��܂���
        exit /b 0
    ) else (
        git checkout %BRANCH_NAME%
        git pull --prune
        @echo �\�[�X���擾���܂���
    )
)

%MSBUILD_PATH% %SOLUTION_FILE% /p:Configuration=%BUILD_CONFIG% /t:%BUILD_TYPE% /m

@echo �r���h���������܂���
pause
exit 0
