#!/usr/bin/env ruby

require "bundler/setup"
require 'spike'
require 'pp'

spike_secret_api_key = ENV['SECRET_KEY'] || (STDERR.puts('set SECRET_KEY variable'); exit)

spike = Spike.new(spike_secret_api_key)


charges = spike.charge.list
pp charges.data.first.class


token_params = {
  'card[number]' => '4444333322221111',
  'card[exp_month]' => '3',
  'card[exp_year]' => '2017',
  'card[cvc]' => '111',
  'card[name]' => 'TARO SPIKE',
  'currency' => 'JPY',
  'email' => 'foo@example.com',
}

token = spike.token.create(token_params)

token = spike.token.retrieve(token.id)
pp token

request_params = {
  amount: 1000,
  currency: "JPY",
  card: token.id
}
products = [{
  id: "00001",
  title: "item title",
  description: "item description",
  language: 'ja',
  price: 1000,
  stock: 10,
  count: 1,
  currency: "JPY",
}]

charge = spike.charge.create(request_params, products)

charges = spike.charge.list(limit: 5)


