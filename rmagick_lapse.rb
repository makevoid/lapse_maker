class LapseMaker

  @@images = []

  def make # (main)
    apply_filters
    
  end

  def get_images
    @@images <<
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
    # RMagick
  end

  def ffmpeg
    exec "ffmpeg ..."
  end

  def save_video
    
  end # consider preview for the app version

  protected

  def exec
    
  end
  
end

# main

lapse = LapseMaker.new
lapse.get_images
lapse.make


# resina poliuretanica ciabatti