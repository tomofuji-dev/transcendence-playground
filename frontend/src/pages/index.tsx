import { apiClient } from '@/lib/axios'
import { useState } from 'react';

function LandingPage() {
  const [data, setData] = useState(null);
  return (
    <>
      <button onClick={()=>{
        apiClient.get('/health').then((res)=>{
          setData(res.data);
        })
      }}>
        Click
      </button>
      <div> {data} </div>
    </>
  );
}

export default LandingPage;