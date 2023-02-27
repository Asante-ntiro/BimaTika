import "./App.css";

import Layout from "./components/Layout";

function App() {
  return (
    <div className="App">
      {/* <Routes>
        <Route path="/" element={<Layout />}>
          <Route path="user1" element={<User />} />
        </Route>
      </Routes> */}
      <Layout />
    </div>
  );
}

export default App;
