# Copyright 2019 Chao Wang
# Licensed under the MIT License (the "License").
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at https://mit-license.org

# February 2019
# This script tests sharpen function of filterizePy package.
# This script tests the sharpen() function

library(testthat)
library(reader)
context("Color image")

test_that("test whether the input image is a valid image formats", {

  expect_error(get.ext(input_img)[[1]]=="pdf")
  expect_error(get.ext(input_img)[[1]]=="csv")

})


test_that("test whether the output image is a valid image formats, and it is the same format as the input image format", {

  expect_error(get.ext(sharpen(input_img))[[1]] != get.ext(input_img))
  expect_error(get.ext(sharpen(input_img))[[1]]=="pdf")
  expect_error(get.ext(sharpen(input_img))[[1]]=="csv")

})


test_that("check the output dimension is the same as the input dimension ", {

  expect_equal(dim(sharpen(input)), dim(input))

})
