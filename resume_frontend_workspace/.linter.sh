#!/bin/bash
cd /home/kavia/workspace/code-generation/slidecv-modern-markdown-resume-74344-8b909eeb/resume_frontend_workspace/resume_frontend
npm run lint
ESLINT_EXIT_CODE=$?
npm run build
BUILD_EXIT_CODE=$?
if [ $ESLINT_EXIT_CODE -ne 0 ] || [ $BUILD_EXIT_CODE -ne 0 ]; then
  exit 1
fi

