require 'rmagick'
require_relative "avconv"

class LapseMaker
  
  include RMagick

  IMAGES_GLOB = "images/*.jpg"

  @@images = []

  def make # (main)
    apply_filters
    rename_images
    create_video
  end

  def get_images
    @@images << Dir.glob IMAGES_GLOB
  end
  
  # app version:
  #
  # def receive_dropped_images
  #   
  # end
  
  def sequence_images
  
  end

  def apply_filters
    @@images.each do |image|
     apply_filters_one image # can be optimized with threads / fibers
    end
    
    # RMagick
    #  img.bilevel_channel(2*QuantumRange/3, RedChannel)
    #  img.contrast + brightness
    #  img.border?
    #  img.color_histogram
  end
  
  def apply_filters_one(image)
    img = Image.new image
    img.write "1.jpg"
    exit
  end
  
  def rename_images
    files =  Dir.glob IMAGES_GLOB

    files.sort.each_with_index do |file, idx|
      idx += 1
      idx = idx.to_s.rjust 4, "0"
      `mv #{file} lapse_#{idx}.jpg`
    end
    
    "lapse_"
  end

  def create_video
    exec "avconv -f image2 -i lapse_%04d.jpg -s hd1080 -threads 8 out.mp4
    "
  end

  def save_video
    
  end # consider preview for the app version

  protected

  def exec(cmd)
    puts "executing: #{cmd}"
    out = `#{cmd}`
    puts out
    out
  end
  
end

# main

lapse = LapseMaker.new
lapse.get_images
lapse.make


# resina poliuretanica ciabatti