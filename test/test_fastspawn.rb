require 'test/unit'
require 'fastspawn'

class FastSpawnTest < Test::Unit::TestCase
  include FastSpawn

  def test_fastspawn_methods_exposed_at_module_level
    assert FastSpawn.respond_to?(:vspawn)
  end

  def test_vspawn_simple
    pid = vspawn('true')
    assert pid > 0

    chpid, status = Process.wait2
    assert_equal chpid, pid
    assert_equal 0, status.exitstatus
  end

  def test_vspawn_with_argv
    pid = vspawn('true', 'with', 'some arguments')
    assert pid > 0

    chpid, status = Process.wait2
    assert_equal chpid, pid
    assert_equal 0, status.exitstatus
  end

  def test_fspawn
    pid = fspawn('true', 'with', 'some stuff')
    assert pid > 0

    chpid, status = Process.wait2
    assert_equal chpid, pid
    assert_equal 0, status.exitstatus
  end
end
