# Copyright 2019 Akansha Vashisth
# Licensed under the MIT License (the "License").
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at https://mit-license.org

# March 2019
# This script tests color function of filterizePy package.
# This script tests the color() function
context("Greenscale image")
library(testthat)
library(reader)
library(imager)
library(stringr)
library(png)

input_img <- imager::load.image("test_img/input1.png")
greenscale("test_img/input1.png")
output_img <- imager::load.image(greenscale("test_img/gs_input1.png"))

# input color: image 1
input_img_pixels <- array(c(c(0.9647059, 0.9254902, 0.8470588,
                              0.9254902, 0.8470588, 0.9647059,
                              0.8470588, 0.9647059, 0.9254902),   #R values
                            c(0.9254902, 0.8470588, 0.6901961,
                              0.8470588, 0.6901961, 0.9254902,
                              0.6901961, 0.9254902, 0.8470588),   #G values
                            c(0.8862745, 0.7686275, 0.5333333,
                              0.7686275, 0.5333333, 0.8862745,
                              0.5333333, 0.8862745, 0.7686275)),  #B values
                          dim = c(3,3,3))

exp_img_pixels <- array(c(c(0.5691765, 0.5460392, 0.4997647,
                            0.5460392, 0.4997647, 0.5691765,
                            0.4997647, 0.5691765, 0.5460392),   #R values
                          c(0.9254902, 0.8470588, 0.6901961,
                            0.8470588, 0.6901961, 0.9254902,
                            0.6901961, 0.9254902, 0.8470588),   #G values
                          c(0.8862745, 0.7686275, 0.5333333,
                            0.7686275, 0.5333333, 0.8862745,
                            0.5333333, 0.8862745, 0.7686275)),  #B values
                        dim = c(3,3,3))
test_that("color image converted to greenscale", {
  greenscale("test_img/input1.png")
  output = png::readPNG("test_img/gs_input1.png")
  expect_equal(output, exp_img_pixels, tolerance=1)
})

test_that("Input and output image dimensions match", {
  expect_equal(dim(input_img), dim(output_img))
})

test_that("test whether the input image is a valid image formats", {
  expect_error(get.ext(input_img)[[1]]=="pdf")
  expect_error(get.ext(input_img)[[1]]=="csv")
})

test_that("test whether the output image is a valid image formats, and it is the same format as the input image format", {
  expect_error(get.ext(color(input_img))[[1]] != get.ext(input_img))
  expect_error(get.ext(color(input_img))[[1]]=="pdf")
  expect_error(get.ext(color(input_img))[[1]]=="csv")
})


