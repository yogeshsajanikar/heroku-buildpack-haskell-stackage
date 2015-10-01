#!/bin/bash


STACK_VERSION=0.1.5.0
STACK_ARCH=x86_64
STACK_OS=linux
STACK_BASE_URL=https://github.com/commercialhaskell/stack/releases/download
STACK_ARCH_BASE=stack-${STACK_VERSION}-${STACL_ARCH}-${STACK_OS}
STACK_ARCH_FILE=${STACK_ARCH_BASE}.tar.gz
STACK_URL=${STACK_BASE_URL}/v${STACK_VERSION}/${STACK_ARCH_FILE}

STACK_INSTALL_BASEDIR=/app

if (test -d $STACK_INSTALL_BASEIDR)
then
    mkdir -p $STACK_INSTALL_BASEDIR
fi

STACK_BIN_PATH=${STACK_INSTALL_BASEDIR}/${STACK_ARCH_BASE}


if !(test -d $STACK_BIN_PATH/stack)
then
    pushd $STACK_INSTALL_BASEDIR
    curl -O $STACK_URL
    tar xzvf $STACK_ARCH_FILE
    rm $STACK_ARCH_FILE
    popd
fi

export PATH=$PATH:$STACK_BIN_PATH

GHC_MAJOR_VERSION=7.10.2

if !(test -n $(stack path --ghc-paths))
then
    stack setup ${GHC_MAJOR_VERSION}
fi


