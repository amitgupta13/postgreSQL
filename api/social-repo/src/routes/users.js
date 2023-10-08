const router = require("express").Router();
const UserRepo = require("../repos/user-repo");

router.get("/users", async (req, res) => {
  const users = await UserRepo.find();
  return res.send(users);
});

router.get("/users/:id", async (req, res) => {
  const { id } = req.params;

  const user = await UserRepo.findById(id);

  if (!user) return res.sendStatus(404);

  return res.send(user);
});

router.post("/users", async (req, res) => {
  const { bio, username } = req.body;

  const user = await UserRepo.insert(username, bio);

  return res.send(user);
});

router.put("/users/:id", async (req, res) => {
  const { id } = req.params;
  const { bio, username } = req.body;

  const user = await UserRepo.update(id, username, bio);

  if (!user) return res.sendStatus(404);

  return res.send(user);
});

router.delete("/users/:id", async (req, res) => {
  const { id } = req.params;
  const user = await UserRepo.delete(id);

  if (!user) return res.sendStatus(404);

  return res.send(user);
});

module.exports = router;
