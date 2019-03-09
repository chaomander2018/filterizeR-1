context("test-mirror")

# Copyright (c) 2019 Master of Data Science at the University of British Columbia
# Licensed under the MIT License (the "License").
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at https://mit-license.org

# Feburary 2019
# This script tests the mirror function of the filterizeR package.
# Input  : A path to an image in .png, .jpeg,.gif,.bmp, .jpg format
# Output : A path to a mirrored image in the same format as the input image file type

library(testthat)
library(imager)
library(stringr)
library(filterizeR)

input_img <- load.image("test_img/test_original.jpg")
output_img <- load.image(mirror("test_img/test_original.jpg"))

test_that("Mirror function throws error for incorrect file path", {
  expect_error(mirror("file_path.random"))
})

test_that("Input output dimensions match", {
  expect_equal(dim(input_img), dim(output_img))
})

test_that("First and last pixel columns match", {
  # for some reason imager reads in the picture flipped
  expect_equal(input_img[1, , , ], output_img[nrow(output_img), , , ], tolerance=1)
})

test_that("Middle column has been transformed correctly", {
  # middle column should stay the same, the cases are different for even and odd dimensioned images
  n <- dim(input_img)[1]
  input_img_odd <- input_img[1:nrow(input_img)-1, , , ]
  output_img_odd <- output_img[2:nrow(input_img), , , ]
  n_odd <- floor(dim(input_img)[1] %% 2)
  
  if (n %% 2 == 0 ){
    mid <- floor(n/2)
    expect_equal(input_img[mid, , , ], output_img[mid+1, , , ], tolerance=1)
  }
  if (n_odd  %% 2 != 0 ){
    mid <- floor(n/2)
    expect_equal(input_img_odd[mid+1, , , ], output_img_odd[mid+1, , , ], tolerance=1)
  }
})



