require 'securerandom'
require 'humanhash/version'
require 'humanhash/wordlist'

module HumanHash

  class HumanHasher
    attr_accessor :words
    attr_accessor :separator
    attr_accessor :wordlist

    def initialize(opts={})
      @words = opts.fetch(:words, 4)
      @separator = opts.fetch(:separator, '-')
      @wordlist = opts.fetch(:wordlist, DEFAULT_WORDLIST)
      nil
    end

    def humanize(hexdigest)
      bytes = [hexdigest].pack("H*").bytes.to_a
      compress(bytes, words).map{|x| wordlist[x]}.join(separator)
    end
    
    def compress(bytes, target)
      len = bytes.size
      return bytes unless target < len

      segment_size = (len / target) + 1;
      bytes.each_slice(segment_size).map{|x| x.reduce{|s,b| s ^ b}}
    end
    
    def uuid
      uuid = SecureRandom.uuid.gsub('-', '')
      [ humanize(uuid), uuid ]
    end

  end

  def self.humanize(hexdigest, opts={})
    h = HumanHasher.new(opts)
    h.humanize(hexdigest)
  end

  def self.uuid(opts={})
    h = HumanHasher.new(opts)
    h.uuid
  end
end
