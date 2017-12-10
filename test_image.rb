require 'mini_magick'
# img = MiniMagick::Image.new("./test.jpg")
# img.colorspace("GRAY")
# img.display



img = MiniMagick::Image.open("./image_fullbg_slice.webp").type
# open("./image_fullbg_slice.webp")
p img
# ("./image_fullbg_slice.webp")