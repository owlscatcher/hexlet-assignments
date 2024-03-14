class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    status, headers, body = @app.call(env)
    stop_time = Time.now
    execution_time = stop_time - start_time

    puts "#{Time.now} Execution time: #{sprintf("%.6f", execution_time)} sec."
    headers['X-Execution-Time'] = execution_time.to_s
    [status, headers, body]
  end
end
