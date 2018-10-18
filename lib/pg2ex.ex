defmodule Pg2ex do
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
