# -*- coding: utf-8 -*-
=begin
########################
----tsv integrator------
This code integrates all tsv files in 
the target directory.
The result file is named "integrated_<DIRECTORY NAME>".
########################
=end
#完成しました！！！

#!/usr/bin/ruby

dir_path = ARGV[0]
#p Dir::entries(dir_path)
res = "\0"

#下の記法は1.9.0以上で無効
#      CSV.open(f, 'r', "\t") do |row|
#        tmp = row.join("\t") + "\n  

#dir = Dir.open(dir_path)
#begin
print("----->integrating tsv files below...")

Dir.foreach(dir_path) {|f|
  p f
  target = open(dir_path + f)
  if File::ftype(target) == "file"
    if File::extname(f) == ".tsv"
      target.each do |line|
        res << line + "\n"
      end
    end
  end
}


#ensure
#    dir.close
#end

resfile = File.open(dir_path + "integrated_data.tsv", 'w')
begin
  resfile.write(res)
ensure
resfile.close
end

#Dir::foreach(dir_pass){|f|
 # if File::ftype(f) == "file"
  #  puts "#{f}"##は評価の意味
#  end
#}
