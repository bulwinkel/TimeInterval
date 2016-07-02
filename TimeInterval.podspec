Pod::Spec.new do |spec|
  spec.name = "TimeInterval"
  spec.version = "0.0.1"
  spec.summary = "Type safe wrapper for time intervals."
  spec.homepage = "https://github.com/bulwinkel/TimeInterval"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Kelvin Bulwinkel" => 'kelvin@bulwinkel.com' }
  spec.social_media_url = "http://twitter.com/kelvinbulwinkel"

  spec.platform = :ios, "9.1"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/bulwinkel/TimeInterval.git", tag: "#{spec.version}", submodules: true }
  spec.source_files = "TimeInterval/**/*.{h,swift}"

end