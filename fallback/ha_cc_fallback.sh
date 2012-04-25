#!/bin/bash

gcc ../prerun/runat.c -o runat
export PATH=.:$PATH

./component_controller.pl START ALL BOTH
./cleanuptest.pl
