# Copyright (c) 2019 Master of Data Science at the University of British Columbia
# Licensed under the MIT License (the "License").
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at https://mit-license.org

# Feburary 2019
# This script tests the function from color.R


# This function colors an image to greenscale.
# Input  : An image in .png, .jpeg,.gif,.bmp, .jpg format
# Output : A green-colored image in the same format as the input image file type

#' Title
#'
#' @param input_path Path of the input image
#'
#' @return a png file at the same path as input_path
#' @export
#' 
#' 
#' 
greenscale <- function(input_path) {
  # ----------------------------- Exception handling -------------------------- #
  img <- tryCatch({
    png::readPNG(input_path)
  }, error = function(e) {
    stop("Please enter valid file path")
  })
  
  height <- dim(img)[1]
  width <- dim(img)[2]
  
  img_gs <- array(dim = dim(img))
  # ---------------------- Regex for saving output image ---------------------- #
  output_path <- stringr::str_replace(input_path, "/(?!.*/)", "/gs_")
  
  for (i in 1:height) {
    for (j in 1:width) {
      R = img[i,j,1]
      G = img[i,j,2]
      B = img[i,j,3]
      
      green = 0.59*R 
      
      # Assigning new green pixels
      img_gs[i,j,1] = green
      img_gs[i,j,2] = G
      img_gs[i,j,3] = B
      
    }
  }
  # ---------------------- Output image ---------------------- #
  png::writePNG(img_gs, output_path)
  return(output_path)
}