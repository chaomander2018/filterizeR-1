# Copyright (c) 2019 Master of Data Science at the University of British Columbia
# Licensed under the MIT License (the "License").
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at https://mit-license.org

# Feburary 2019
# This script tests the function from mirror.R

# This script tests the mirror function of the filterizeR package.
# This function mirrors an image.
# Input  : An image in .png, .jpeg,.gif,.bmp, .jpg format
# Output : A mirrored image in the same format as the input image file type

#' Returns a mirrored image
#'
#' @param input_path string, path for the input png file
#'
#' @return an image file at the same path as input_path and returns the output path
#' @export 
#'
#' @examples
#' #' mirror("test_img/test_original.jpg")

mirror <- function(input_path) {
  
  input_img <- imager::load.image(input_path)
  output_img <- input_img
  dim <- input_img %>% dim
  
  # negative lookahead regex
  output_path <- str_replace(input_path, "/(?!.*/)", "/mirrored_")
  
  output_img <- as.cimg(input_img[dim[1]:1,,,], dim=dim)
  
  imager::save.image(im=output_img, file=output_path)
  return(output_path)
}

