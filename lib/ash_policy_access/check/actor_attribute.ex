defmodule AshPolicyAccess.Check.ActorAttribute do
  use AshPolicyAccess.SimpleCheck

  @impl true
  def describe(opts) do
    "user.#{opts[:field]} == #{inspect(opts[:value])}"
  end

  @impl true
  def match?(actor, _context, opts) do
    value = opts[:value]
    match?({:ok, ^value}, Map.fetch(actor, opts[:field]))
  end
end
