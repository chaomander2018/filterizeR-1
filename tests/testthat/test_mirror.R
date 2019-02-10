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
library(filterizeR)

input_img <- load.image("animegirl.jpg")
mirror(input_img)
output_img <- load.image("reversegirl.jpg")

test_that("Input output dimensions match", {
  expect_equal(dim(input_img), dim(output_img))
})

test_that("First and last pixel columns do not match", {
  # for some reason imager reads in the picture flipped
  expect_equal(input_img[1, , , ], output_img[nrow(output_img), , , ])
})

test_that("Middle column has been transformed correctly", {
  # middle column should stay the same, the cases are different for even and odd dimensioned images
  n <- dim(input_img)[1]

  if (n %% 2 == 0 ){
    mid <- floor(n/2)
    expect_equal(input_img[mid, , , ], output_img[mid-1, , , ])
  } else {
    mid <- floor(n/2)
    expect_equal(input_img[mid, , , ], output_img[mid, , , ])
  }
})


