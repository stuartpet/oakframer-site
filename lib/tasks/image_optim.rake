require 'image_optim'

namespace :images do
  desc "Compress all project images before deployment"
  task compress: :environment do
    optimizer = ImageOptim.new(
      nice: 10,
      pngout: false,
      svgo: false,
      verbose: true
    )

    Dir.glob("app/assets/images/projects/*.{jpg,jpeg,png}").each do |file|
      puts "Compressing: #{file}"
      result = optimizer.optimize_image!(file)
      if result
        puts "✅ Optimized: #{file}"
      else
        puts "⚠️ Skipped (already optimized): #{file}"
      end
    end
  end
end
