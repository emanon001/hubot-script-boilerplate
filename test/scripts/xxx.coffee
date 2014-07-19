require '../helper'

describe 'xxx', ->
  beforeEach (done) ->
    @kakashi.scripts = [require '../../src/scripts/xxx']
    @kakashi.users = [{ id: 'emanon001', room: 'hitoridokusho' }]
    @kakashi.start().then done, done

  afterEach (done) ->
    @kakashi.stop().then done, done

  describe 'receive "@hubot XXX"', ->
    it 'send "XXX!"', (done) ->
      sender = id: 'emanon001', room: 'hitoridokusho'
      message = '@hubot XXX'
      @kakashi
        .receive sender, message
        .then =>
          expect(@kakashi.send.callCount).to.equal(1)
          expect(@kakashi.send.firstCall.args[1]).to.equal('XXX!')
        .then (-> done()), done
