# frozen_string_literal: true

# BEGIN
require 'uri'

class Url
  extend Forwardable
  include Comparable

  attr_accessor :uri, :url_without_query, :query_hash
  def_delegators :uri, :scheme, :host, :port, :query

  def initialize(uri)
    @uri = URI(uri)
    @query_hash = query_params
    @url_without_query = get_url_without_query
  end

  def <=>(other_uri)
    (self.query_hash <=> other_uri.query_hash) <=>
    (self.url_without_query <=> other_uri.url_without_query)
  end

  def query_params
    if query.nil?
      {}
    else
      params_arr = query.split('&').map { |param| param.split('=') }
      params_arr.each_with_object({}) do |param, acc|
        acc[param.first.to_sym] = param.last
      end.sort.to_h
    end
  end

  def query_param(key, value=nil)
    query_params.key?(key) ? query_params[key] : value
  end

  def get_url_without_query
    "#{scheme}://#{host}:#{port}"
  end
end
# END
