# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/rg'
require 'yaml'

require_relative 'test_load_all'

def wipe_database
  OnlineCheckIn::Member.map(&:destroy)
  OnlineCheckIn::Household.map(&:destroy)
  OnlineCheckIn::Account.map(&:destroy)
end

DATA = {
  accounts: YAML.load(File.read('app/db/seeds/accounts_seed.yml')),
  members: YAML.load(File.read('app/db/seeds/member_seed.yml')),
  household: YAML.load(File.read('app/db/seeds/household_seed.yml'))
}.freeze
