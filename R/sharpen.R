# Copyright (c) 2019 Master of Data Science at the University of British Columbia
# Licensed under the MIT License (the "License").
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at https://mit-license.org

# Feburary 2019
# This script tests the function from sharpen.R

#' Sharpened
#' This function sharpens an image.
#' input_img  : An image in .png, .jpeg,.gif,.bmp, .jpg format
#' output_img : A sharpened image in the same format as the input image file type
#'
#' @param input_path character, path of the input png file
#'
#' @return a png file path
#' @export
#' @examples
#' sharpen("../img/theme.png")
#'


sharpen <- function(input_path) {
  
  
  input_img <- EBImage::readImage(input_path)
  
  #dim <- input_img %>% dim
  
  # Construct the sharpen filter `ft`.
  ft <- matrix(c(0.00, -0.75, 0.00,-0.75, 4.50,-0.75, 0.00, -0.75, 0.00 ), nrow=3, ncol =3)
  # Apply the sharpen filter `ft` to the input image.
  output_img <- filter2(input_img, ft, boundary = c("circular", "replicate"))
  output_path <- stringr::str_replace(input_path, "/(?!.*/)", "/sharpened_")
  writeImage(output_img, output_path, quality = 85)
  return(output_path)
  
}


