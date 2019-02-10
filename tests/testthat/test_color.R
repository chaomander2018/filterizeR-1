# Copyright 2019 Akansha Vashisth, Master of Data Science at the University of British Columbia
# Licensed under the MIT License (the "License").
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at https://mit-license.org

# February 2019
# This script tests color function of filterizePy package.
# This script tests the color() function
# Input  : A path to an image in .png, .jpeg,.gif,.bmp, .jpg format
# Output : A path to a greenscaled image in the same format as the input image file type

library(filterizeR)
library(testthat)
library(reader)
library(imager)

context("Color image")

input_img <- load.image("animegirl.jpg")
color(input_img)
output_img <- load.image("reversegirl.jpg")


test_that("test whether the input image is a valid image formats", {
  # Test the valid input format
  expect_error(get.ext(input_img)[[1]]=="pdf")
  expect_error(get.ext(input_img)[[1]]=="csv")

})


test_that("test whether the output image is a valid image formats, and it matches the input image format", {
  # Test the output format is valid and it matches the input format
  expect_equal(dim(input_img), dim(output_img))
  expect_error(get.ext(color(input_img))[[1]]=="pdf")
  expect_error(get.ext(color(input_img))[[1]]=="csv")

})


test_that("check the output dimension matches the input dimension ", {
  # Test the output dimension matches the input dimension
  expect_equal(dim(color(input)), dim(input))

})
