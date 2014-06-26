# from: https://gist.github.com/makevoid/5518095

class Avconv
  def self.conv(images_glob)
    
    # run ruby lapse_rename.rb 
    # then:
    # avconv -f image2 -i lapse_%04d.jpg -s hd1080 -threads 8 out.mp4

    files =  Dir.glob(images_glob)

    files.sort.each_with_index do |file, idx|
      idx += 1
      idx = idx.to_s.rjust 4, "0"
      `mv #{file} lapse_#{idx}.jpg`
    end
    
  end
end