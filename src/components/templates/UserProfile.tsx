import React from 'react';
import { useAppSelector, useAppDispatch } from '../../hooks/useDisSelector';
import { setUser } from '../../store/slices/userSlice';

const UserProfile: React.FC = () => {
  const user = useAppSelector((state) => state.user.user);
  const dispatch = useAppDispatch();

  const handleLogin = () => {
    dispatch(setUser({ name: 'Jane Doe', id: 'user123' }));
  };

  return (
    <div>
      {user ? <p>Hello, {user.name}</p> : <button onClick={handleLogin}>Log In</button>}
    </div>
  );
};

export default UserProfile;
