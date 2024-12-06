import React, { useEffect, useState } from 'react';

function App() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch(import.meta.env.VITE_APP_API_URL + '/cities_info')
      .then((response) => response.json())
      .then((data) => {
        setData(data)
      }
      );
  }, []);

  return (
    <div>
      <h1>React and Node.js API Integration</h1>
      {data &&
        <ul>{
          data.map(item => {
            return (<li>
              {`${item.city} - ${item.state} - ${item.population}`}
            </li>)
          })
        }</ul>}
    </div>
  );
}

export default App;
