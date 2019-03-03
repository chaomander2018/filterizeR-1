# Copyright 2019 Chao Wang, Master of Data Science at the University of British Columbia
# Licensed under the MIT License (the "License").
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at https://mit-license.org

# February 2019
# This script tests sharpen function of filterizePy package.
# This script tests the sharpen() function
# Input  : A path to an image in .png, .jpeg,.gif,.bmp, .jpg format
# Output : A path to a sharpened image in the same format as the input image file type
context("Sharpen image")


library(filterizeR)
library(testthat)
library(reader)
library(imager)
library(EBImage)
library(devtools)
library(usethis)
library(stringr)
library(lattice)
library(magrittr)
library(dplyr)
library(BiocManager)



#source("R/sharpen.R")
test_img <- "test_img/test_sharpen.png"

input_img <- EBImage::readImage(test_img)
output_img <-EBImage::readImage(sharpen(test_img))

#"test_img/sharpened_theme.png")


test_that("test whether the input image is a valid image formats", {
  # Test the valid input format
  expect_false(get.ext(test_img)[[1]]=="gif")
  expect_false(get.ext(test_img)[[1]]=="csv")
  
})


test_that("test whether the output image is a valid image formats, and it matches the input image format", {
  # Test the output format is valid and it matches the input format
  expect_equal(dim(input_img), dim(output_img))
  expect_false(get.ext(sharpen(test_img))[[1]]=="gif")
  expect_false(get.ext(sharpen(test_img))[[1]]=="csv")
  
})


test_that("check the output RGB values are different then input RBG values", {
  # Test the output dimension matches the input dimension
  expect_false(sum(input_img[,,2]) == sum(output_img[,,2]))
  expect_false(sum(input_img[,,1]) == sum(output_img[,,1]))
  expect_false(sum(input_img[,,3]) == sum(output_img[,,3]))
})
