RPS_SRC=./src
BIN_DIR=./bin
if [ -d ${BIN_DIR} ]
then
    rm -rf ${BIN_DIR}
fi
mkdir ${BIN_DIR}

# Firefox
FIREFOX_SRC=./firefox/src
FIREFOX_DIR=./firefox/tmp
if [ -d ${FIREFOX_DIR} ]
then
    rm -rf ${FIREFOX_DIR}
fi
mkdir ${FIREFOX_DIR}
cp -r ${FIREFOX_SRC}/* ${FIREFOX_DIR}
cp ${RPS_SRC}/* ${FIREFOX_DIR}/content
zip -r ${BIN_DIR}/IIDXScoreLoaderForRPS.zip ${FIREFOX_DIR}/*
mv ${BIN_DIR}/IIDXScoreLoaderForRPS.zip ${BIN_DIR}/IIDXScoreLoaderForRPS.xpi

# Chrome (crxmake gem required)
CHROME_SRC=./chrome/src
CHROME_DIR=./chrome/tmp
if [ -d ${CHROME_DIR} ]
then
    rm -rf ${CHROME_DIR}
fi
mkdir ${CHROME_DIR}
cp -r ${CHROME_SRC}/* ${CHROME_DIR}
cp ${RPS_SRC}/* ${CHROME_DIR}
crxmake --pack-extension=${CHROME_DIR} --extension-output=${BIN_DIR}/IIDXScoreLoaderForRPS.crx
