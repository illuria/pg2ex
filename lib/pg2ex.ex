defmodule Pg2ex do

  @spec register_name(atom(), pid()) :: :yes | :no
    def register_name(group_name, pid) do
    try do
      start()
      create(group_name)
      join(group_name, pid)
      :yes
    catch
      :exit, _ -> :no
    end
  end

  @spec unregister_name(atom()) :: any()
  def unregister_name(group_name) do
    Pg2ex.leave(group_name, self())
  end

  @spec whereis_name(atom()) :: pid() | :undefined
  def whereis_name(group_name) do
    case Pg2ex.get_closest_pid(group_name) do
      {:error, _} -> :undefined
      pid -> pid
    end
  end

  @spec send(atom(), any()) :: pid()
  def send(group_name, msg) do
    case Pg2ex.whereis_name(group_name) do
      :undefined -> exit({:badarg, {group_name, msg}})
      pid -> Kernel.send(pid, msg); pid
    end
  end

  @spec create(atom()) :: :ok
  def create(group_name) do
    :pg2.create(group_name)
  end

  @spec delete(atom()) :: :ok
  def delete(group_name) do
    :pg2.delete(group_name)
  end

  @spec get_closest_pid(atom()) ::
          pid() | {:error, {:no_process, atom()}} | {:error, {:no_such_group, atom()}}
  def get_closest_pid(group_name) do
    :pg2.get_closest_pid(group_name)
  end

  @spec get_local_members(atom()) :: [pid()] | {:error, {:no_such_group, atom()}}
  def get_local_members(group_name) do
    :pg2.get_local_members(group_name)
  end

  @spec get_members(atom()) :: [pid()] | {:error, {:no_such_group, atom()}}
  def get_members(group_name) do
    :pg2.get_members(group_name)
  end

  @spec join(atom(), pid()) :: :ok | {:error, {:no_such_group, atom()}}
  def join(group_name, pid) do
    :pg2.join(group_name, pid)
  end

  @spec leave(atom(), pid()) :: :ok | {:error, {:no_such_group, atom()}}
  def leave(group_name, pid) do
    :pg2.leave(group_name, pid)
  end

  @spec start() :: {:ok, pid()} | {:error, any()}
  def start() do
    :pg2.start()
  end

  @spec start_link() :: {:ok, pid()} | {:error, any()}
  def start_link() do
    :pg2.start_link()
  end

  @spec which_groups() :: [atom()]
  def which_groups do
    :pg2.which_groups()
  end
end
